const { getStoredProfile } = require('../profileStore');
const runQuery = require('../lib/runQuery');

async function getUserManagement(req, res) {
  try {
    const users = await runQuery('SELECT id, username, email, is_deleted FROM users WHERE role = "player" ORDER BY id');

    const usersWithProfiles = users.map(user => {
      const storedProfile = getStoredProfile(user.id) || {};
      return {
        user_id: user.id,
        username: user.username,
        email: user.email,
        bio: storedProfile.bio || '',
        deleted: user.is_deleted
      };
    });

    return res.render('admin/userManagement', { users: usersWithProfiles });
  } catch (error) {
    console.error(error);
    return res.status(500).send('Error loading user management.');
  }
}
async function deleteUser(req, res) {
  const userId = req.params.userId;
    try {
        await runQuery('UPDATE users SET is_deleted = 1 WHERE id = ?', [userId]);
        res.redirect('/admin/userManagement');
    } catch (error) {
        console.error(error);
        res.status(500).send('Error deleting user.');
    }
}

async function undeleteUser(req, res) {
  const userId = req.params.userId;
    try {
        await runQuery('UPDATE users SET is_deleted = 0 WHERE id = ?', [userId]);
        res.redirect('/admin/userManagement');
    } catch (error) {
        console.error(error);
        res.status(500).send('Error restoring user.');
    }
}

async function getQuestionManagement(req, res) {
  try {
    const questions = await runQuery('SELECT * from fact_types ORDER BY id;');
    return res.render('admin/questionManagement', { questions });
  } catch (error) {
    console.error(error);
    return res.status(500).send('Error loading question management.');
  }
}

async function deleteQuestion(req, res) {
  try {
    const factTypeId = req.params.id;
    await runQuery('DELETE FROM fact_types WHERE id = ?', [factTypeId]);
    return res.redirect('admin/questionManagement')
  }
  catch (error) {
    console.error(error);
    return res.status(500).send('Error deleting question.');
  }
}

async function getCityManagement(req, res) {
  try {
    const cities = await runQuery('SELECT id, name FROM cities ORDER BY name');
    return res.render('admin/cityManagement', { cities });
  } catch (error) {
    console.error(error);
    return res.status(500).send('Error loading city management.');
  }
}

module.exports = { getUserManagement, getQuestionManagement, getCityManagement };
