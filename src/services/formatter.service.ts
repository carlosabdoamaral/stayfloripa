export class FormatterService {
    toBRL(amount: number): string {
        return amount.toLocaleString("pt-br", { style: "currency", currency: "BRL" });
    }
}