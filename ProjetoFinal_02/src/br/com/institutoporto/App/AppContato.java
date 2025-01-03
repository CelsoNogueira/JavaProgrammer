package br.com.institutoporto.App;

import br.com.institutoporto.classes.Contato;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AppContato {
	public static void main(String[] args) {
		try {
			Scanner scanner = new Scanner(System.in);
			List<Contato> contatos = new ArrayList<>();
			int numeroDeContatos;

			System.out.print("Quantos contatos você deseja adicionar? ");
			numeroDeContatos = scanner.nextInt();
			scanner.nextLine(); // Consumir a nova linha

			for (int i = 1; i <= numeroDeContatos; i++) {
				System.out.println("Adicionando contato " + i + ":");
				System.out.print("Nome: ");
				String nome = scanner.nextLine();
				System.out.print("Telefone: ");
				String telefone = scanner.nextLine();
				System.out.print("Email: ");
				String email = scanner.nextLine();

				Contato contato = new Contato(i, nome, telefone, email);
				contatos.add(contato);
			}

			System.out.println("\nContatos adicionados:");
			for (Contato contato : contatos) {
				System.out.println(contato.mostrarDados());
			}

			scanner.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
	}
}