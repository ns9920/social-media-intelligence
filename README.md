<div>
    <h1>Social Media Intelligence</h1>
    <p>This repository contains an R script for analyzing social media data, specifically a network of telephone calls. The script performs tasks such as computing neighborhood overlap of edges, calculating edge betweenness, and partitioning the graph using edge betweenness clustering.</p>
    <h2>Usage</h2>
    <ol>
        <li>Clone the repository:
            <pre><code>git clone https://github.com/ns9920/social-media-intelligence.git</code></pre>
        </li>
        <li>Navigate to the project directory:
            <pre><code>cd social-media-intelligence</code></pre>
        </li>
        <li>Open the R script file <code>social_media_analysis.R</code>.</li>
        <li>Set the working directory to the location of the data file (e.g., <code>setwd("~/Projects/teaching/301116-social_media_intelligence/labs/")</code>).</li>
        <li>Run the script, and it will perform the following tasks:
            <ul>
                <li>Load the telephone call network data from the file <code>telephoneCalls.net</code></li>
                <li>Compute the neighborhood overlap of each edge in the network</li>
                <li>Calculate the edge betweenness of the network</li>
                <li>Partition the graph using edge betweenness clustering</li>
                <li>Visualize the partitioned graph and dendrogram</li>
            </ul>
        </li>
    </ol>
    <h2>Dependencies</h2>
    <p>This project requires the following R package:</p>
    <ul>
        <li>igraph</li>
    </ul>
    <p>Make sure to install the package before running the script.</p>
    <h2>Data</h2>
    <p>The script assumes the presence of a data file named <code>telephoneCalls.net</code> in the Pajek format, containing the telephone call network data. If you have a different data file or format, you will need to modify the script accordingly.</p>
    <h2>Contributing</h2>
    <p>Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.</p>
</div>
