package com.niit.cartbackend.dao;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.niit.cartbackend.model.Login;
import com.niit.cartbackend.model.Register;
@Repository("registerDAO")
public class RegisterDAOImpl implements RegisterDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public RegisterDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
@Transactional
public List<Register> list() 
{
	@SuppressWarnings("unchecked")
	List<Register> listUser =(List<Register>)
			sessionFactory.getCurrentSession().createCriteria(Login.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
			return listUser;
}
@Transactional
public Login get(int id)
{
	String hql ="from Login where id="+"'"+id+"'";
	Query query =(Query) sessionFactory.getCurrentSession().createQuery(hql);
	List<Login> listUser =(List<Login>) query.getResultList();
	if(listUser != null && listUser.isEmpty()){
		return listUser.get(0);
	}	
	return null;
}
@Transactional
public void saveOrUpdate(Register register) {
	sessionFactory.getCurrentSession().saveOrUpdate(register);
}

@Transactional
public void delete(int id)
{
	Login userToDelete =new Login();
	userToDelete.setId(id);
	sessionFactory.getCurrentSession().delete(userToDelete);
}
}