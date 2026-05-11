// Keep session payload in one place
function buildSessionUser(user, storedProfile = {}) {
  return {
    id: user.id,
    username: user.username,
    email: user.email,
    role: user.role,
    bio: storedProfile.bio || '',
    profileImageUrl: storedProfile.profileImageUrl || null
  };
}

module.exports = { buildSessionUser };