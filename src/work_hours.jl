using Dates

function work_hours(wh, dts::Date, dte::Date)

    for (ts, te, h) in wh

        (te < ts) && error("End date smaller than starting date.")

        # Ignore intervals outside the desired ones
        ((te <= dts) || (ts >= dte)) && continue

        ch += (Dates.week(max(ts, dts) - Dates.week(min(ts, dte))) * h

    end

    return wh

end
