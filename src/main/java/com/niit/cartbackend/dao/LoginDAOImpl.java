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
import com.niit.cartbackend.model.Login;
@Repository("loginDAO")
public class LoginDAOImpl implements LoginDAO{
	 Logger log = LoggerFactory.getLogger(LoginDAOImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	public LoginDAOImpl(SessionFactory sessionFactory) {
		try {
			this.sessionFactory = sessionFactory;
		} catch (Exception e) {
			log.error(" Unable to connect to db");
			e.printStackTrace();
		}
	}
	@Transactional
	public List<Login> list() {
		@SuppressWarnings("unchecked")
		List<Login> login=(List<Login>)
				sessionFactory.getCurrentSession().createCriteria(Login.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
				return login;
	}
	@Transactional
	public void delete(int id) {
		Login UserToDelete=new Login();
		UserToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(UserToDelete);	
	}
	@Transactional
	public Login get(int id) {
		String hql="from Login where id="+"'"+id+"'";
		Query query= sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Login> listUser=(List<Login>) query.list();
		if(listUser !=null&& !listUser.isEmpty()){
			return listUser.get(0);
		}
		return null;
	}
	@Transactional
	public void save(Login login) {
	
		sessionFactory.getCurrentSession().save(login);
	}
	@Transactional
	public void update(Login login) {
		sessionFactory.getCurrentSession().update(login);
		
	}
}