const { getStoredProfile } = require('../profileStore');
const runQuery = require('../lib/runQuery');

async function getUserManagement(req, res) {
  try {
    const users = await runQuery('SELECT id, username, email, role, is_deleted FROM users ORDER BY id');

    const usersWithProfiles = users.map(user => {
      const storedProfile = getStoredProfile(user.id) || {};
      return {
        user_id: user.id,
        username: user.username,
        email: user.email,
        role: user.role,
        bio: storedProfile.bio || '',
        deleted: user.is_deleted
      };
    });

    const players = usersWithProfiles.filter(user => user.role === 'player');
    const admins = usersWithProfiles.filter(user => user.role === 'admin');

    return res.render('admin/userManagement', { players, admins });
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
    return res.redirect('admin/questionManagement');
  }
  catch (error) {
    console.error(error);
    return res.status(500).send('Error deleting question.');
  }
}
async function addQuestion(req, res) {
  try {
    const { name, unit, data_type } = req.body;
    await runQuery('INSERT INTO fact_types (name, unit, data_type) VALUES (?, ?, ?)', [name, unit, data_type]);
    return res.redirect('admin/questionManagement');
  }
  catch (error) {
    console.error(error);
    return res.status(500).send('Error adding question type.');
  }
}

async function getCityManagement(req, res) {
  try {
    const factTypes = await runQuery('SELECT id, name FROM fact_types ORDER BY id');
    const allCities = await runQuery('SELECT id, name, state FROM cities ORDER BY id');
    const citiesWithFacts = await runQuery(`
      SELECT cf.city_id, ft.name as fact_type_name,
             COALESCE(cf.value_text, CAST(CAST(cf.value_number AS UNSIGNED) AS CHAR), CAST(cf.value_boolean AS CHAR)) as fact_value
      FROM city_facts cf 
      JOIN fact_types ft ON cf.fact_type_id = ft.id 
      ORDER BY cf.city_id, ft.id
    `);

    const factsMap = {};
    citiesWithFacts.forEach(row => {
      if (!factsMap[row.city_id]) {
        factsMap[row.city_id] = {};
      }
      factsMap[row.city_id][row.fact_type_name] = row.fact_value;
    });

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
    const result = await runQuery('INSERT INTO cities (name, state) VALUES (?, ?)', [name, state]);
    const cityId = result.insertId;

    const factTypes = await runQuery('SELECT id, data_type FROM fact_types');
    const inserts = [];

    for (const factType of factTypes) {
      const fieldName = `fact_${factType.id}`;
      const rawValue = req.body[fieldName];
      if (rawValue == null || rawValue === '') {
        continue;
      }
      let valueText = null;
      let valueNumber = null;
      let valueBoolean = null;
      if (factType.data_type === 'number') {
        const parsed = Number(rawValue);
        if (!Number.isNaN(parsed)) {
          valueNumber = parsed;
        }
      } else if (factType.data_type === 'boolean') {
        valueBoolean = rawValue === 'true' || rawValue === '1' || rawValue === 'on';
      } else {
        valueText = String(rawValue);
      }

      inserts.push(
        runQuery(
          'INSERT INTO city_facts (city_id, fact_type_id, value_text, value_number, value_boolean) VALUES (?, ?, ?, ?, ?)',
          [cityId, factType.id, valueText, valueNumber, valueBoolean]
        )
      );
    }

    await Promise.all(inserts);
    return res.redirect('/admin/cityManagement');
  } catch (error) {
    console.error(error);
    return res.status(500).send('Error adding city.');
  }
}

module.exports = { getUserManagement, deleteUser, undeleteUser, getQuestionManagement, deleteQuestion, addQuestion, getCityManagement, deleteCity, addCity};