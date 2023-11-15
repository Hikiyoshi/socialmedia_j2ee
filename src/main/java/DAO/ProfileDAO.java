package DAO;

import java.util.ArrayList;
import java.util.List;

import Models.Profile;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class ProfileDAO {
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
	
	public static List<Profile> selectAll() {
		_manager = JpaUtils.createManager();
		List<Profile> profiles = new ArrayList<>();
		
		try {
			_manager.getTransaction().begin();
			
			String jpql = "SELECT p FROM Profile p";
			
			TypedQuery<Profile> query = _manager.createQuery(jpql, Profile.class);			
			profiles = query.getResultList();
			
			_manager.getTransaction().commit();			
			System.out.println("Transaction completed successfully!");		
		}
		catch (Exception e) {
			_manager.getTransaction().rollback();
			System.out.println("Failed to commit the transaction! Roll-back to the previous state.");
			e.printStackTrace();
		}
		finally {
			JpaUtils.shutdown(_manager);			
		}
		
		return profiles;
	}
	
	public static Profile selectByUsername(String username) {
		_manager = JpaUtils.createManager();
		Profile profile = new Profile();
		
		try {
			_manager.getTransaction().begin();
			
			profile = _manager.find(Profile.class, username);
			
			_manager.getTransaction().commit();			
			System.out.println("Transaction completed successfully!");		
		}
		catch (Exception e) {
			_manager.getTransaction().rollback();
			System.out.println("Failed to commit the transaction! Roll-back to the previous state.");
			e.printStackTrace();
		}
		finally {
			JpaUtils.shutdown(_manager);			
		}
		
		return profile;
	}

    
}
