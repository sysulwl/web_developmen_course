public class Fib{
	final static int N = 92;
    public static void main(String args[]){
		long fibs[] = new long[N] ;
		fibs[0] = 0L;
		fibs[1] = 1L;
		int i = 2;
		while(i < N)
		{
			fibs[i] = fibs[i-1] + fibs[i-2];
			i++;
		}
       System.out.println(fibs[N-1]); 
		double nums[] = new double[N];
		nums[0] = 0;
		nums[1] = 1;
		i = 2;
		while(i < N)
		{
			nums[i] = 1.0 * fibs[i] / fibs[i-1];
			i++;
		}
		for(double rate : nums)
		{
			System.out.println(rate); 
		}
    }
}



