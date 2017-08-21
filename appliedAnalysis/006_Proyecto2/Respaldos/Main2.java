
import java.util.*;
import java.io.*;
public class Main2{

        public static void main(String args[]) throws Exception{
	File file2 = new File("Primer");
        Scanner sc=new Scanner(System.in);

	
	Scanner sc2=new Scanner(file2);
        String linea;
        String linea2;
	String sp []=new String[32];
	
        for(int i = 0; i < 569; i++){

                linea=sc.nextLine();
		linea2=sc2.nextLine();
		sp=linea.split("\t");

                System.out.print(linea2 + ",");

		for (int j=1 ; j< 31; j++){
		System.out.print(sp[j] + ",");
		}
		
		System.out.println(sp[31]);

        }
		sc2.close();
        }

}
