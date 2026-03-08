for lat_par in # some numbers ; do 
    # replace lat_par, write scf.in
    sed "s/lat_par/${lat_par}/g" scf.in.template > scf.in
    # execute with pw.x 
    pw.x < scf.in > scf.out
    # read total energy 
    energy=$(grep "!" scf.out | tail -1 | awk '{print $5}')
    # write lat_par and energy to energy_lat_par.dat
    echo "$lat_par $energy" >> energy_lat_par.dat
done