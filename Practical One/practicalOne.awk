BEGIN {
    FS = ","
    max_cols = 0
    row_count = 0
}

{
    row_count++
    
    for (i = 1; i <= NF; i++) 
    {
        row_total[row_count] += $i
        col_total[i] += $i
        
        if (i > max_cols) 
        {
            max_cols = i
        }
    }
}

END {
    print "========================="
    print "Rectangular matrix totals"
    print "========================="
    printf "Input file: %s\n\n", FILENAME
    
    for (i = 1; i <= row_count; i++) 
    {
        printf "Total for row %d: %d\n", i, row_total[i]
    }
    
    for (j = 1; j <= max_cols; j++) 
    {
        if (!(j in col_total)) 
        {
            col_total[j] = 0
        }
        printf "Total for column %d: %d\n", j, col_total[j]
    }
    
    matrix_total = 0
    for (j = 1; j <= max_cols; j++) 
    {
        matrix_total += col_total[j]
    }

    printf "\nTotal for entire matrix: %d\n", matrix_total
}

