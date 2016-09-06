package com.niit.cartbackend.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cartbackend.model.Cart;
import com.niit.cartbackend.model.Supplier;



@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public CartDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Cart> list() {
		@SuppressWarnings("unchecked")
		List<Cart> list = (List<Cart>) sessionFactory.getCurrentSession().createCriteria(Cart.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return list;
	}

	@Transactional
	public void saveOrUpdate(Cart cart) {
		sessionFactory.getCurrentSession().saveOrUpdate(cart);
	}
	@Transactional
	public void update(Cart cart) {
		sessionFactory.getCurrentSession().update(cart);
	}

	@Transactional
	public void save(Cart cart) {
		sessionFactory.getCurrentSession().save(cart);
	}

	

	@Transactional
	public Cart get(int id) {
		String hql = "from Cart where userID=" + "'" + id + "'  and status = " + "'N'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<Cart> list = (List<Cart>) query.list();

		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}

		return null;
	}

	@Transactional
	public int getTotalAmount(int id) {
		String hql = "select sum(price) from Cart where userID = " + "'" + id + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		/*query.executeUpdate();
		return query.getFirstResult();*/   // Need to check
		
		return 26322;

	}

	@Transactional
	public int delete(int id) {
	
		Cart CartToDelete=new Cart();
		CartToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(CartToDelete);
	
		return 0;
	}

}
