const bcrypt = require('bcrypt');
const userRepository = require('../repositories/user.repository');
const { saveStoredProfile, getStoredProfile, deleteStoredProfile } = require('../profileStore');
const { listPresetProfileImages, maxBioLength, maxUploadedImageLength } = require('../config/profileConfig');
const { getProfileImage, trimString } = require('../utils/profile.util');
const { buildSessionUser } = require('../utils/session.util');

async function hashPassword(password) {
  const saltRounds = 10;
  return await bcrypt.hash(password, saltRounds);
}

async function comparePassword(plainPassword, hashedPassword) {
  return await bcrypt.compare(plainPassword, hashedPassword);
}

async function signup(username, email, password, verifPassword) {
  if (!password || !verifPassword) {
    throw new Error('Both password fields are required');
  }

  if (password !== verifPassword) {
    throw new Error('Passwords must match');
  }

  const hashedPassword = await hashPassword(password);
  const existingUserByEmail = await userRepository.getUserByEmail(email);
  if (existingUserByEmail) {
    const error = new Error('Email already exists');
    error.code = 'ER_DUP_ENTRY';
    throw error;
  }

  const existingUserByUsername = await userRepository.getUserByUsername(username);
  if (existingUserByUsername) {
    const error = new Error('Username already exists');
    error.code = 'ER_DUP_ENTRY';
    throw error;
  }

  await userRepository.createUser(username, email, hashedPassword);
  const newUser = await userRepository.getUserByEmail(email);
  return newUser;
}

async function login(email, password) {
  // 1. find user
  let user = await userRepository.getUserByEmail(email);

  if (!user) {
    // check if email is actually a username
    user = await userRepository.getUserByUsername(email);
    if (!user) {
      throw new Error('User not found');
    }
  }

  // 2. validate password 
  const passwordMatches = await bcrypt.compare(password, user.password);

  if (!passwordMatches) {
    throw new Error('Incorrect password');
  }

  // 3. load profile metadata (bio, profile image)
  const storedProfile = getStoredProfile(user.id) || {};

  // 4. return structured data 
  return { user, storedProfile };
}

async function deleteAccount(userId, password) {
  const user = await userRepository.getUserById(userId);

  if (!user || user.is_deleted) {
    throw new Error('Account not found.');
  }

  if (!(await comparePassword(password, user.password))) {
    throw new Error('Incorrect password.');
  }

  await userRepository.deleteUser(userId);
  deleteStoredProfile(userId);
}

async function updateProfile(user, body) {
  const bio = trimString(body.bio).slice(0, maxBioLength);

  const imageResult = getProfileImage({
    selectedAvatar: trimString(body.selectedAvatar),
    uploadedImageData: trimString(body.uploadedImageData),
    currentImage: user.profileImageUrl
  });

  if (imageResult.error) {
    return { error: 'image' };
  }

  const updatedProfile = {
    bio,
    profileImageUrl: imageResult.profileImageUrl
  };

  const saved = saveStoredProfile(user.id, updatedProfile);

  if (!saved) {
    return { error: 'update' };
  }

  const storedProfile = getStoredProfile(user.id) || {};

  return {
    updatedUser: buildSessionUser(user, storedProfile)
  };
}

module.exports = { signup, login, deleteAccount, updateProfile};
