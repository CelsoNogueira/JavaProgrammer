package br.com.institutoporto.classes;

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
		String linha = ("-".repeat(30) + "\n");
		
		/*Formatter fmt = new Formatter();
		String mostrar = fmt.format("|%-8 | %-6s | %-10s | %-7|%n",
				"CODIGO",
				"NOME",
				"TELEFONE",
				"EMAIL").toString();
		fmt.close();*/
		String mostrar = linha +
				"Codigo: " + this.codigo + "\nNome: " + this.nome +
				"\nTelefone: " + this.telefone + "\nEmail: " + this.email + "\n";
		return mostrar;
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
