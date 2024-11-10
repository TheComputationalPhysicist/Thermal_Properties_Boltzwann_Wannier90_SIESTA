#!/bin/bash
# give permission chmod +x and run as ./Te.sh
file=hetero
dir=TE

# Create subdirectories
mkdir -p $dir/{seebeck,elcond,kappa,sigmas}

# Loop over temperature range and extract data
for temp in {300..1200..300}; do # min max step
    for prop in seebeck elcond kappa sigmas; do
        # Extract data and save to new files with temperature-dependent names
        case $prop in
            seebeck)
                awk -v temp="$temp" '{if ($2 == temp) {print $1, $3 > "'$dir'/'$prop'/'$file'_'$prop'_xx_"temp"K.dat"; print $1, $7 > "'$dir'/'$prop'/'$file'_'$prop'_yy_"temp"K.dat"; print $1, $11 > "'$dir'/'$prop'/'$file'_'$prop'_zz_"temp"K.dat"}}' $file'_'$prop'.dat'
                ;;
            *)
                awk -v temp="$temp" '{if ($2 == temp) {print $1, $3 > "'$dir'/'$prop'/'$file'_'$prop'_xx_"temp"K.dat"; print $1, $5 > "'$dir'/'$prop'/'$file'_'$prop'_yy_"temp"K.dat"; print $1, $8 > "'$dir'/'$prop'/'$file'_'$prop'_zz_"temp"K.dat"}}' $file'_'$prop'.dat'
                ;;
        esac
    done
done

