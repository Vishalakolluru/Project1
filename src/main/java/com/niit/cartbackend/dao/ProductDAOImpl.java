package com.niit.cartbackend.dao;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.niit.cartbackend.model.Product;
@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public ProductDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
/*	@Transactional
	public List<Product> list() {
	
		List<Product> listProduct=(List<Product>)
				sessionFactory.getCurrentSession().createCriteria(Product.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
				return listProduct;
	}*/
	@Transactional
	public Product get(int id) {
		
		String hql="from Product where id="+"'"+id+"'";
		Query query= sessionFactory.getCurrentSession().createQuery(hql);
		List<Product> listProduct=(List<Product>) query.getResultList();
		if(listProduct !=null || listProduct.isEmpty()){
			return listProduct.get(0);
		}
		return null;
	}
	@Transactional
	public void saveorUpdate(Product product) {
		sessionFactory.getCurrentSession().save(product);
		
	}
	@Transactional
	public void delete(int id) {
		Product ProductToDelete=new Product();
		ProductToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(ProductToDelete);	
}

	@Transactional
	public List<Product> list() {
		Session session =sessionFactory.openSession();
		List<Product> list=session.createQuery("from Product").list();
		session.close();
		return list;
		
	}
	@Transactional
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		List<Product> list=session.createQuery("from Product").list();
		session.close();
		return list;
		}
	@Transactional
	public int deleteProduct(int id) {
			Session session=sessionFactory.openSession();
			org.hibernate.Transaction tx=session.beginTransaction();
			Product product=(Product)session.load(Product.class, id);
			session.delete(product);
			tx.commit();
			session.close();
			return id;
		
	}
	
}