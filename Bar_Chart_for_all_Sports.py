sports = summer_2016_medals["Sport"].unique()
print(sports) // This gives the unique items in the Sport column

fig, ax = subplots()
for sport in sports:
	sport_df = summer_2016_medals[summer_2016_medals["Sport"] == sport]
	ax.bar(sport, sport_df["Height"].mean(), 
		   yerr = sport_df["Height"].std())
		   
ax.set_ylabel("Height (cm)")
ax.set_xticklabels(sports, rotation=90)
plt.show()