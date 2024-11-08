package br.com.institutoporto.App;

import br.com.institutoporto.classes.Contato;

public class AppContato {
	public static void main(String[] args) {
		Contato contato1 = new Contato(1, "Leonardo", "11-99999-9999", "Leonardo@porto.com.br");
		Contato contato2 = new Contato(2, "Celso", "11-3243-7653", "Celso@porto.com.br");
		Contato contato3 = new Contato(3, "Jessica", "11-5003-4889", "Jessica@porto.com.br");
	
		
		System.out.println(contato1.mostrarDados());
		System.out.println(contato2.mostrarDados());
		System.out.println(contato3.mostrarDados());
	}

}
