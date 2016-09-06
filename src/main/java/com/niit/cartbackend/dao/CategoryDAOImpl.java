package com.niit.cartbackend.dao;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.cartbackend.model.Category;
@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	private static final Logger logger = 
			LoggerFactory.getLogger(CategoryDAOImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	public CategoryDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	@Transactional
	public List<Category> list() {
		@SuppressWarnings("unchecked")
		List<Category> listCategory=(List<Category>)
		sessionFactory.getCurrentSession().createCriteria(Category.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listCategory;	
	}
	
	@Transactional
public void saveorUpdate(Category category) {
		sessionFactory.getCurrentSession().save(category);
	}
	
	@Transactional
public void delete(int id) {
	Category CategoryToDelete=new Category();
	CategoryToDelete.setId(id);
	sessionFactory.getCurrentSession().delete(CategoryToDelete);
}
	@Transactional
	public Category get(int id) {
		logger.debug("calling get");
		String hql="from Category where id="+"'"+id+"'";
	Query query= sessionFactory.getCurrentSession().createQuery(hql);
	logger.debug("hql:" + hql);
	@SuppressWarnings("unchecked")
	List<Category> listCategory=(List<Category>) query.list();
	if(listCategory !=null&& !listCategory.isEmpty()){
		return listCategory.get(0);
	}
	logger.debug("End get");
	return null;
	}
	@Transactional
	public Category getByName(String name) {
		String hql = "from Category where name=" + "'"+ name +"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Category> listCategory = (List<Category>) query.list();
		
		if (listCategory != null && !listCategory.isEmpty()) {
			return listCategory.get(0);
		}
		
		return null;
	}
	
		
	
}