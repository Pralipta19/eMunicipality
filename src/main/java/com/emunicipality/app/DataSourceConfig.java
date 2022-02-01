package com.emunicipality.app;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

@Configuration
public class DataSourceConfig {

	@Autowired
	private Environment environment;

	@Value("${jdbc.driverClassName}")
	private String driverClassName;

	@Value("${jdbc.url}")
	private String jdbcURL;

	@Value("${jdbc.username}")
	private String username;

	@Value("${jdbc.password}")
	private String password;

	@Bean
	public DataSource createDataSource() throws Exception {

		// ComboPooledDataSource ds = new ComboPooledDataSource();

		BasicDataSource ds = new BasicDataSource();
		// ds.setJdbcUrl(jdbcURL);
		// ds.setDriverClass(driverClassName);
		// ds.setUser(username);
		// ds.setPassword(password);

		ds.setUrl(jdbcURL);
		ds.setDriverClassName(driverClassName);
		ds.setUsername(username);
		ds.setPassword(password);

		return ds;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() throws Exception {
		LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
		factoryBean.setDataSource(createDataSource());
		factoryBean.setPackagesToScan(new String[] { "com.emunicipality.app.model" });
		factoryBean.setJpaVendorAdapter(jpaVendorAdapter());
		factoryBean.setJpaProperties(jpaProperties());
		return factoryBean;
	}

	@Bean
	public JpaVendorAdapter jpaVendorAdapter() {
		HibernateJpaVendorAdapter hibernateJpaVendorAdapter = new HibernateJpaVendorAdapter();
		return hibernateJpaVendorAdapter;
	}

	private Properties jpaProperties() {
		/*
		 * Properties properties = new Properties(); properties.put("hibernate.dialect",
		 * environment.getRequiredProperty("datasource.sampleapp.hibernate.dialect"));
		 * properties.put("hibernate.hbm2ddl.auto", environment.getRequiredProperty(
		 * "datasource.sampleapp.hibernate.hbm2ddl.method"));
		 * properties.put("hibernate.show_sql",
		 * environment.getRequiredProperty("datasource.sampleapp.hibernate.show_sql"));
		 * properties.put("hibernate.format_sql",
		 * environment.getRequiredProperty("datasource.sampleapp.hibernate.format_sql"))
		 * ; if(StringUtils.isNotEmpty(environment.getRequiredProperty(
		 * "datasource.sampleapp.defaultSchema"))){
		 * properties.put("hibernate.default_schema",
		 * environment.getRequiredProperty("datasource.sampleapp.defaultSchema")); }
		 * return properties;
		 */

		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		properties.put("hibernate.id.new_generator_mappings", "false");
		return properties;

	}
}
