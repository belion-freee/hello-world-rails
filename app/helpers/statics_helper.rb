module StaticsHelper
  def graph_data(content, id: "graph_data")
    films = content.sort_by {|arr| arr["release_date"] }
    convert = proc {|k| films.maps(:[], k).to_json.html_safe }
    data = { label: "スコアグラフ", ylabel: "スコア", xlabel: "製作年(昇順)", ticks: {min: 40, max: 100}.to_json.html_safe, labels: convert.("title"), values: convert.("rt_score") }
    { data: data, id: id }
  end
end
