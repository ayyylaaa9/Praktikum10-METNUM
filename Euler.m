function [x,y] = Euler (f,a,b,y0,N)
  h = (b-a)/N;

  fprintf('\nHasil Perhitungan Metode Euler\ni\tx\t\ty\n')
  #Memulai iterasi ke-0
  x = a;
  y = y0;
  fprintf('%d\t%f\t%f\n',
          0, x, y);
  #Memulai iterasi pertama sampai selesai
  for i = 1:N;
    y(i+1) = y(i)+h*f(x(i),y(i));
    x(i+1) = x(i)+h;
    fprintf('%d\t%f\t%f\n',
            i, x(i+1), y(i+1));
  endfor
##  y=y(end);
end

