public class test {
    public static void main(String[] args) {
        String card = "King";
        int value = 0;

        switch (card) {
            case "Ace":
                value = 11;
            case "King":
            case "Queen":
            case "Jack":
                value = 10;
            default:
                value = -1;
        }

        System.out.println(value);
    }
}
