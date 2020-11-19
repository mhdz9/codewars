/*
Hello,
I'm a little class and I have a secret.
Will you find it ?
*/
import java.lang.reflect.Field;

public class Guesser {
    public void guess() {
        LittleClass.isMySecret("notVeryWellProtected");
        
        LittleClass obj=new LittleClass();
        try {
            Field field=LittleClass.class.getDeclaredField("secret");
            field.setAccessible(true);
            Object value=field.get(obj);
            System.out.println(value);
        }
        catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        catch (SecurityException e) {
            e.printStackTrace();
        }
        catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        catch (IllegalArgumentException e) {
            e.printStackTrace();
        }
    }
}