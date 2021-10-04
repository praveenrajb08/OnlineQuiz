import java.util.*;
public class pks {
    public static String findDay(int month, int day, int year) {
        
        Calendar cl = Calendar.getInstance();
        cl.set(year, month-1, day);
        int num = cl.get(Calendar.DAY_OF_WEEK);

        String[] Days = {"SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"}; 
        
        return Days[num-1];
    }
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int m,d,y;
        m=sc.nextInt();
        d=sc.nextInt();
        y=sc.nextInt();
        int ans=findDay(m,d,y);
        System.out.println(ans);

        
    }
}
