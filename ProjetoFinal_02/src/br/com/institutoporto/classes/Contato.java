package br.com.institutoporto.classes;

import java.util.Formatter;

public class Contato {
	private int codigo;
	private String nome;
	private String telefone;
	private String email;

	//Construtor
	public Contato(int codigo, String nome, String telefone, String email) {
		this.setCodigo(codigo);
		this.setNome(nome);
		this.setTelefone(telefone);
		this.setEmail(email);

	}
	
	//Metodo mostrarDados
	public String mostrarDados() {
		String linha = ("-".repeat(80) + "\n");
		
        StringBuilder sb = new StringBuilder();
        Formatter fmt = new Formatter(sb);

        fmt.format("| %-8s | %-20s | %-15s | %-25s |\n", "CODIGO", "NOME", "TELEFONE", "EMAIL");
        fmt.format("| %-8d | %-20s | %-15s | %-25s |\n", this.codigo, this.nome, this.telefone, this.email);
        fmt.close();
        return linha + sb.toString() + linha;
        
		/*String mostrar = linha +
				"Codigo: " + this.codigo + "\nNome: " + this.nome +
				"\nTelefone: " + this.telefone + "\nEmail: " + this.email + "\n";
		return mostrar;*/
	}

	//Getters and Setters
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		if(nome == null || nome.trim().equals("")){
			throw new IllegalArgumentException("O nome é invalido!");
		}
		try {
			Double.parseDouble(nome.trim());
			throw new IllegalArgumentException("O nome não pode ser um número!");
		}catch (NumberFormatException e) {
			
		}
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Nome: " + this.nome + "\n" + "Telefone: " + this.telefone;
	}

}
