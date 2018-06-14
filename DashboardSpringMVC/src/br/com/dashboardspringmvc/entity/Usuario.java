package br.com.dashboardspringmvc.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the usuario database table.
 * 
 */
@Entity
@NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="usua_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer usuaId;

	@Column(name="usua_senha")
	private String usuaSenha;

	@Column(name="usua_usuario")
	private String usuaUsuario;

	public Usuario() {
	}

	public Integer getUsuaId() {
		return this.usuaId;
	}

	public void setUsuaId(Integer usuaId) {
		this.usuaId = usuaId;
	}

	public String getUsuaSenha() {
		return this.usuaSenha;
	}

	public void setUsuaSenha(String usuaSenha) {
		this.usuaSenha = usuaSenha;
	}

	public String getUsuaUsuario() {
		return this.usuaUsuario;
	}

	public void setUsuaUsuario(String usuaUsuario) {
		this.usuaUsuario = usuaUsuario;
	}

}