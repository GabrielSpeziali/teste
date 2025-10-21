// Nome: Gabriel Speziali
// Matrícula: (coloca sua matrícula aqui)

import java.util.Scanner;

public class MonitoramentoJumentos {

    // Requisito 1: Cálculo da taxa de redução
    public static double calcularTaxaReducao(int populacaoInicial, int populacaoAtual) {
        return (1 - (double) populacaoAtual / populacaoInicial) * 100;
    }

    // Requisito 2: Verificação de risco crítico
    public static boolean estaEmRiscoCritico(double taxaReducao) {
        return taxaReducao >= 90;
    }

    // Requisito 3: Simulação de abates
    public static int simularImpactoAbate(int populacaoAtual, int abatesAnuais, int anosSimulados) {
        int populacaoRestante = populacaoAtual - (abatesAnuais * anosSimulados);
        return Math.max(populacaoRestante, 0);
    }

    // Requisito 4: Exibição da declaração final
    public static void exibirDeclaracaoFinal(int populacaoRestante, int anos) {
        System.out.println("\n--- RESULTADO DA SIMULAÇÃO ---");
        System.out.println("População restante após " + anos + " anos: " + populacaoRestante + " jumentos.");
        if (populacaoRestante <= 0) {
            System.out.println("⚠️ A espécie foi extinta! É urgente agir para preservar o jumento nordestino!");
        } else {
            System.out.println("Ainda há esperança! Iniciativas de conservação são vitais.");
        }
        System.out.println("\nPrograma de Monitoramento Finalizado.");
    }

    // Método principal
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int populacaoInicial = 1400000;
        int populacaoAtual = 84000;
        int abatesAnuais = 50000;

        System.out.println("=== S.O.S. JUMENTO NORDESTINO - SISTEMA DE MONITORAMENTO ===");
        System.out.println("População inicial de referência: " + populacaoInicial);
        System.out.println("População atual estimada: " + populacaoAtual);
        System.out.println("Abates anuais (simulados): " + abatesAnuais);

        double taxaReducao = calcularTaxaReducao(populacaoInicial, populacaoAtual);
        System.out.printf("\n[Análise Inicial] Taxa de Redução Histórica: %.2f%%\n", taxaReducao);

        if (estaEmRiscoCritico(taxaReducao)) {
            System.out.println("[Status] Espécie em Risco CRÍTICO (Redução > 90%)!");
        } else {
            System.out.println("[Status] Espécie em risco controlado.");
        }

        System.out.print("\nQuantos anos futuros você deseja simular o impacto dos abates (Ex: 1, 3, 5)? ");
        int anos = input.nextInt();

        int populacaoRestante = simularImpactoAbate(populacaoAtual, abatesAnuais, anos);

        exibirDeclaracaoFinal(populacaoRestante, anos);

        input.close();
    }
}