package DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Models.Reaction;
import Utilities.JpaUtils;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TemporalType;
import jakarta.persistence.TypedQuery;

public class ReactionDAO {
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
			entity.setDatecreated(updatedReaction.getDatecreated());

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
	
	public static List<Reaction> selectAll() {
		_manager = JpaUtils.createManager();
		List<Reaction> reactions = new ArrayList<>();
		
		try {
			_manager.getTransaction().begin();
			
			String jpql = "SELECT r FROM Reaction r";
			
			TypedQuery<Reaction> query = _manager.createQuery(jpql, Reaction.class);			
			reactions = query.getResultList();
			
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
		
		return reactions;
	}
	
	public static Reaction selectById(String ID) {
		_manager = JpaUtils.createManager();
		Reaction reaction = new Reaction();
		
		try {
			_manager.getTransaction().begin();
			
			reaction = _manager.find(Reaction.class, ID);
			
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
		
		return reaction;
	}
	
//	public static List<Reaction> selectUpUntil(Date endDate) {
//		_manager = JpaUtils.createManager();
//		List<Reaction> reactions = new ArrayList<>();
//		
//		try {
//			_manager.getTransaction().begin();
//			
//			String jpql = "SELECT r FROM Reaction r WHERE r.datecreated <= :endDate";
//			
//			TypedQuery<Reaction> query = _manager.createQuery(jpql, Reaction.class);
//			query.setParameter("endDate", endDate, TemporalType.DATE);
//			
//			reactions = query.getResultList();
//			
//			_manager.getTransaction().commit();			
//			System.out.println("Transaction completed successfully!");		
//		}
//		catch (Exception e) {
//			_manager.getTransaction().rollback();
//			System.out.println("Failed to commit the transaction! Roll-back to the previous state.");
//			e.printStackTrace();
//		}
//		finally {
//			JpaUtils.shutdown(_manager);			
//		}
//		
//		return reactions;
//	}
//	
//	public static List<Reaction> selectBetweenTwoDates(Date startDate, Date endDate) {
//		_manager = JpaUtils.createManager();
//		List<Reaction> reactions = new ArrayList<>();
//		
//		try {
//			_manager.getTransaction().begin();
//			
//			String jpql = "SELECT r FROM Reaction r WHERE r.datecreated BETWEEN :startDate AND :endDate";
//			
//			TypedQuery<Reaction> query = _manager.createQuery(jpql, Reaction.class);
//			query.setParameter("startDate", startDate, TemporalType.DATE);
//			query.setParameter("endDate", endDate, TemporalType.DATE);
//			
//			reactions = query.getResultList();
//			
//			_manager.getTransaction().commit();			
//			System.out.println("Transaction completed successfully!");		
//		}
//		catch (Exception e) {
//			_manager.getTransaction().rollback();
//			System.out.println("Failed to commit the transaction! Roll-back to the previous state.");
//			e.printStackTrace();
//		}
//		finally {
//			JpaUtils.shutdown(_manager);			
//		}
//		
//		return reactions;
//	}
}
