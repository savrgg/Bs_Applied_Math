import java.util.*;
import java.io.*;

public class Main{

	public static void main(String args[])throws Exception{

	Scanner sc=new Scanner(System.in);
	String s;	
	int i=0;

	while((s=sc.nextLine())!="EOF"){
		Scanner sc2=new Scanner(new FileReader(s));
		if(i==0){
			System.out.println(sc2.nextLine());	
			System.out.println(sc2.nextLine());
        	i++;
		}//end if
        	else{
			sc2.nextLine();
			System.out.println(sc2.nextLine());	
		i++;
		}//end else

	}//end while
	
		
	}//close main

}//close Main
