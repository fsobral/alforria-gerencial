using Dates
using CSV: Rows

function read_ch_files(directory, filename, professor)

    wh = []

    # Need to search all the directories having the format YYYYMMDD
    for d in directory

        # Need to search for the professor name in the CSV file
        for row in CSV.Rows(d + filename, header=0,
                            types=Dict(1=>String, 2=>Int, 3=>Int))

            (row[1] == professor) &&
                append!(wh, (d, Int(row[2]), Int(row[3])))

        end

    end

    return wh

end

function work_hours(wh, dts::Date, dte::Date)

    for (ts, te, h) in wh

        (te < ts) && error("End date smaller than starting date.")

        # Ignore intervals outside the desired ones
        ((te <= dts) || (ts >= dte)) && continue

        ch += (Dates.week(max(ts, dts) - Dates.week(min(ts, dte))) * h

    end

    return wh

end
