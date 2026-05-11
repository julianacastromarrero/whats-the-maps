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
    const questions = await runQuery('SELECT q.id, q.question_text, c.name AS city_name FROM questions q JOIN cities c ON q.city_id = c.id');
    return res.render('admin/questionManagement', { questions });
  } catch (error) {
    console.error(error);
    return res.status(500).send('Error loading question management.');
  }
}

async function getCityManagement(req, res) {
  try {
    const factTypes = await runQuery('SELECT id, name FROM fact_types ORDER BY id');
    const allCities = await runQuery('SELECT id, name, state FROM cities ORDER BY id');
    const citiesWithFacts = await runQuery(`
      SELECT cf.city_id, ft.name as fact_type_name,
             COALESCE(cf.value_text, CAST(cf.value_number AS CHAR), CAST(cf.value_boolean AS CHAR)) as fact_value
      FROM city_facts cf 
      JOIN fact_types ft ON cf.fact_type_id = ft.id 
      ORDER BY cf.city_id, ft.id
    `);

    // Create a map of city_id -> facts
    const factsMap = {};
    citiesWithFacts.forEach(row => {
      if (!factsMap[row.city_id]) {
        factsMap[row.city_id] = {};
      }
      factsMap[row.city_id][row.fact_type_name] = row.fact_value;
    });

    // Build cities array with facts
    const cities = allCities.map(city => ({
      ...city,
      facts: factsMap[city.id] || {}
    }));
    
    return res.render('admin/cityManagement', { cities, factTypes });
  } catch (error) {
    console.error(error);
    return res.status(500).send('Error loading city management.');
  }
}
async function deleteCity(req, res) {
  const cityId = req.params.cityId;
    try {
        await runQuery('DELETE FROM cities WHERE id = ?', [cityId]);
        res.redirect('/admin/cityManagement');
    } catch (error) {
        console.error(error);
        res.status(500).send('Error deleting city.');
    }
}
async function addCity(req, res) {
  const { name, state } = req.body;
    try {
        await runQuery('INSERT INTO cities (name, state) VALUES (?, ?)', [name, state]);
        res.redirect('/admin/cityManagement');
    } catch (error) {
        console.error(error);
        res.status(500).send('Error adding city.');
    }
}

module.exports = { getUserManagement, getQuestionManagement, getCityManagement, deleteCity, addCity, deleteUser, undeleteUser };
