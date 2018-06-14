package br.com.dashboardspringmvc.uteis;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ConexaoEntityFactory {

	// nome da unidade de persistencia definia no persistence.xml
	private static final String UNIT_NAME = "DashboardSpringMVCPU";

	private EntityManagerFactory emf = null;

	private EntityManager em = null;

	public EntityManager getEntityManager() {

		if (emf == null) {
			Properties props = new Properties();
			try {

				final InputStream stream = ConexaoEntityFactory.class.getResourceAsStream("/dataBase.properties");
				props.load(stream);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			emf = Persistence.createEntityManagerFactory(UNIT_NAME, props);
		}

		if (em == null) {
			em = emf.createEntityManager();
		}

		return em;
	}
}