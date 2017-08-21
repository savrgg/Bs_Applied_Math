import java.util.*;

public class Main{

	public static void main(String args[]){

		
		String linea;
		String[] sp=new String[32];	
		Scanner sc = new Scanner(System.in);		

		for ( int i = 1; i < 569; i++ ){
		
			linea=sc.nextLine();
			sp=linea.split("\t");
			System.out.print( sp[1] + "\t");

			for( int j = 1; j < 32; j++){
				System.out.print( sp[j] ); 
			}//end for
			System.out.println();		
		}//end for

	}//end main	

}//end class
