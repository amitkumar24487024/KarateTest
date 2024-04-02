package examples.users.utils;

class APIClass {
    public int add(int num1, int num2) {
        return num1 + num2;
    }

    public static void main(String[] args) {
        APIClass api = new APIClass();
        System.out.println(api.add(2, 3));
    }
}