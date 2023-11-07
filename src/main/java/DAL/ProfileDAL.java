package DAL;

import Models.Profile;
import jakarta.persistence.EntityManager;

public class ProfileDAL {
private static EntityManager _manager;
	
	public static boolean createProfile(Profile newProfile) {
		_manager = JpaUtils.createManager();

		try {
			_manager.getTransaction().begin();

			_manager.persist(newProfile);

			_manager.getTransaction().commit();
			return true;
		} catch (Exception e) {
			_manager.getTransaction().rollback();
			e.printStackTrace();
			return false;
		} finally {
			JpaUtils.shutdown(_manager);
		}
	}

	public static boolean updateProfile(Profile updatedProfile) {
		_manager = JpaUtils.createManager();

		try {		
			Profile entity = _manager.find(Profile.class, updatedProfile.getUsername());
			_manager.getTransaction().begin();
			
			entity.setPassword(updatedProfile.getPassword());
			entity.setSurname(updatedProfile.getSurname());
			entity.setFirstname(updatedProfile.getFirstname());
			entity.setImgAvatar(updatedProfile.getImgAvatar());
			entity.setDateBirth(updatedProfile.getDateBirth());
			entity.setGender(updatedProfile.getGender());
			entity.setEmail(updatedProfile.getEmail());
			entity.setPhonenumber(updatedProfile.getPhonenumber());

			_manager.getTransaction().commit();
			return true;
		} catch (Exception e) {
			_manager.getTransaction().rollback();
			e.printStackTrace();
			return false;
		} finally {
			JpaUtils.shutdown(_manager);
		}
	}

	public static boolean deleteProfile(String username) {
		_manager = JpaUtils.createManager();
		
		try {
			_manager.getTransaction().begin();
			
			Profile entity = _manager.find(Profile.class, username);
			_manager.remove(entity);
			
			_manager.getTransaction().commit();
			return true;
		}
		catch (Exception e) {
			_manager.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
		finally {
			JpaUtils.shutdown(_manager);			
		}
	}
}
