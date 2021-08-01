import folium
import pandas as pd
import os

#Import json and dataset
canada = os.path.join('data', 'canada.json')
newdata = os.path.join('data', 'newdata.csv')
canada_data = pd.read_csv(newdata)

#Create map
m = folium.Map(location=[70, -100], zoom_start = 3.4)

#Create choropleth visualisation
m.choropleth(
    geo_data=canada,
    name='choropleth',
    data=canada_data,
    columns=['Province', 'Hospitals per capita'],
    key_on='feature.properties.NAME',
    fill_color='YlGnBu',
    fill_opacity=0.7,
    line_opacity=0.2,
    legend_name='Hospitals per capita'
)

#GeoJson
style_function = lambda x: {'fillColor': '#fff', 'color':'#000', 'fillOpacity': 0.1, 'weight': 0.1}
highlight_function = lambda x: {'fillColor': '#000', 'color':'#000', 'fillOpacity': 0.5, 'weight': 0.1}
overlay = folium.features.GeoJson(canada, style_function=style_function, control=False, highlight_function=highlight_function,
    tooltip=folium.features.GeoJsonTooltip(fields=['NAME', 'POP','NOH'],
    aliases=['Province:', 'Population:', 'Number of Hospitals:']
    )
)
m.add_child(overlay)
##folium.LayerControl().add_to(m)

#experiment latlon
hospitals = os.path.join('data', 'dfgio.csv')
hospital_data = pd.read_csv(hospitals)
for i in range(len(hospital_data)):
    folium.CircleMarker(location=[hospital_data['latitude'][i], hospital_data['longitude'][i]], color='#1B288C', radius=0.8).add_to(m)

#Generate map
m.save('map.html')

