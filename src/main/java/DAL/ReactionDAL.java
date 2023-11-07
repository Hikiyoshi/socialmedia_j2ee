package DAL;

import Models.Reaction;
import jakarta.persistence.EntityManager;

public class ReactionDAL {
	private static EntityManager _manager;
	
	public static boolean createReaction(Reaction newReaction) {
		_manager = JpaUtils.createManager();

		try {
			_manager.getTransaction().begin();

			_manager.persist(newReaction);

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

	public static boolean updateReaction(Reaction updatedReaction) {
		_manager = JpaUtils.createManager();

		try {		
			Reaction entity = _manager.find(Reaction.class, updatedReaction.getIdReact());
			_manager.getTransaction().begin();
			
			entity.setUsername(updatedReaction.getUsername());
			entity.setIdPost(updatedReaction.getIdPost());
			entity.setContent(updatedReaction.getContent());
			entity.setDatecreaed(updatedReaction.getDatecreaed());

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

	public static boolean deleteReaction(String reactID) {
		_manager = JpaUtils.createManager();
		
		try {
			_manager.getTransaction().begin();
			
			Reaction entity = _manager.find(Reaction.class, reactID);
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
