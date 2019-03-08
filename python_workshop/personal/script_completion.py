def replace_bad_chars(alignment):
    for record in alignment:
        string = str(record.seq)
        new_string = re.sub('[^actgACTG-]','N',string)
        record.seq = Seq(new_string)

alignment = AlignIO.read(open(args.input), args.input_format)
if args.fix_invalid_characters:
    replace_bad_chars(alignment)
SeqIO.write(alignment, args.output, args.output_format)

# plottting completion
kmeans = KMeans(n_clusters=4).fit(tuple_data)
labels = kmeans.labels_
center0,center1,center2,center3 = kmeans.cluster_centers_

fig = plt.figure(figsize=(10,10))
plt.scatter(petal_list,sepal_list,c=labels,cmap='plasma')
plt.plot(center0[0],center0[1],marker='^',color='black',markersize=20)
plt.plot(center1[0],center1[1],marker='^',color='black',markersize=20)
plt.plot(center2[0],center2[1],marker='^',color='black',markersize=20)
plt.plot(center3[0],center3[1],marker='^',color='black',markersize=20)
plt.xlabel('sepal length')
plt.ylabel('petal length')
plt.title('50 Iris samples')
fig.savefig('./scatter_plot_kmeans.pdf',bbox_inches='tight', dpi = 500)