package com.niit.cartbackend;
import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.niit.cartbackend.dao.CategoryDAO;
import com.niit.cartbackend.dao.CategoryDAOImpl;
import com.niit.cartbackend.dao.SupplierDAO;
import com.niit.cartbackend.dao.SupplierDAOImpl;
import com.niit.cartbackend.dao.LoginDAO;
import com.niit.cartbackend.dao.LoginDAOImpl;
import com.niit.cartbackend.model.Category;
import com.niit.cartbackend.model.Product;
import com.niit.cartbackend.model.Supplier;

import com.niit.cartbackend.model.Login;
import com.niit.cartbackend.model.Register;
@Configuration
@ComponentScan("com.niit.cartbackend")
@EnableTransactionManagement
public class ApplicationContextConfigure {
	@Bean(name="dataSource")
	public DataSource getDataSource(){
		DriverManagerDataSource dataSource=new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl(" jdbc:h2:tcp://localhost/~/shopingcart1");
		dataSource.setUsername("sa");
		dataSource.setPassword("sa");
		return dataSource;
		}
	private Properties getHibernateProperties(){
		Properties properties=new Properties();
		properties.put("hibernate.show_sql","true");
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.dialect","org.hibernate.dialect.H2Dialect");
		return properties;	
	} 
	@Autowired
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource){
		LocalSessionFactoryBuilder sessionBuilder=new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClass(Category.class);
		sessionBuilder.addAnnotatedClass(Supplier.class);
		sessionBuilder.addAnnotatedClass(Product.class);
		sessionBuilder.addAnnotatedClass(Login.class);
		sessionBuilder.addAnnotatedClass(Register.class);
		sessionBuilder.addAnnotatedClasses(com.niit.cartbackend.model.Cart.class);
		return sessionBuilder.buildSessionFactory();	
	}
	@Autowired
	@Bean(name="transactionManager")
	public HibernateTransactionManager geTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager transactionManager=new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
	@Autowired
	@Bean(name="categoryDAO")
	public CategoryDAO getCategoryDAO(SessionFactory sessionFactory){
		return new CategoryDAOImpl(sessionFactory);	
	}
	@Autowired
	@Bean(name="supplierDAO")
	public SupplierDAO getSupplierDAO(SessionFactory sessionFactory){
		return new SupplierDAOImpl(sessionFactory);	
	}
	@Autowired
	@Bean(name="loginDAO")
	public LoginDAO getLoginDAO(SessionFactory sessionFactory){
		return new LoginDAOImpl(sessionFactory);	
	}
}
