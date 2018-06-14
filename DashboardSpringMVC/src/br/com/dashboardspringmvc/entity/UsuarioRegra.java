package br.com.dashboardspringmvc.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the usuario_regra database table.
 * 
 */
@Entity
@Table(name="usuario_regra")
@NamedQuery(name="UsuarioRegra.findAll", query="SELECT u FROM UsuarioRegra u")
public class UsuarioRegra implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="usre_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer usreId;

	@Column(name="usre_regr_id")
	private Integer usreRegrId;

	@Column(name="usre_usua_id")
	private Integer usreUsuaId;

	public UsuarioRegra() {
	}

	public Integer getUsreId() {
		return this.usreId;
	}

	public void setUsreId(Integer usreId) {
		this.usreId = usreId;
	}

	public Integer getUsreRegrId() {
		return this.usreRegrId;
	}

	public void setUsreRegrId(Integer usreRegrId) {
		this.usreRegrId = usreRegrId;
	}

	public Integer getUsreUsuaId() {
		return this.usreUsuaId;
	}

	public void setUsreUsuaId(Integer usreUsuaId) {
		this.usreUsuaId = usreUsuaId;
	}

}