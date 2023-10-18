if(((im(i,j-1) != 0 && im(i,j-1) != 255) && (im(i-1,j) != 0 && im(i-1,j) != 255)) || (im(i-1,j-1)!=0 && im(i-1,j-1)!=255) || (im(i-1,j+1)!=0 && im(i-1,j+1)!=255))
        if((im(i-1,j-1)!=0 && im(i-1,j-1)!=255) && im(i-1,j) == 0)
          nE = im(i,j);
          nR = im(i-1,j-1);
        else
          if((im(i-1,j+1)!=0 && im(i-1,j+1)!=255) && im(i-1,j) == 0)
            nE = im(i,j);
            nR = im(i-1,j+1);
          else
             nE = im(i,j-1);
             nR = im(i-1,j);
          endif
        endif
