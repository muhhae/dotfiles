dim=$(hyprctl getoption decoration:dim_inactive | grep "int:" | awk '{print $2}')

if [ "$dim" -eq 1 ]
then
    hyprctl keyword decoration:dim_inactive false
else
    hyprctl keyword decoration:dim_inactive true
fi
