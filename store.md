---
layout: page
title: Items For Sale
permalink: /store/
---

<div class="store-intro">
  <h2>Items For Sale</h2>
  <p>Browse through items I currently have available. Click on any item to express interest.</p>
</div>

<div class="products-grid">
  {% for product in site.data.products %}
    <div class="product-card">
      <div class="product-image-wrapper">
        <img src="{{ site.baseurl }}{{ product.image }}" alt="{{ product.name }}" class="product-image">
        <div class="product-overlay">
          <button class="inquiry-button" onclick="openProductInquiry('{{ product.name | replace: "'", "\\'" }}')">I'm Interested</button>
        </div>
      </div>
      <h3 class="product-name">{{ product.name }}</h3>
      <p class="product-price">{{ product.price }}</p>
      <p class="product-pickup"><i class="fas fa-map-marker-alt"></i> Pickup: {{ product.pickup }}</p>
      <p class="product-description">{{ product.description }}</p>
    </div>
  {% endfor %}
</div>

<script>
  function openProductInquiry(productName) {
    // From your URL, I can see these are the correct IDs
    const formId = '1FAIpQLSfl78TsAuL3yCf9jdlmClJdPsPJ2WPIAEenB2zJ3f5plV4Iyg';
    const productFieldId = '910720600'; 
    
    // Create the pre-filled Google Form URL
    const formUrl = `https://docs.google.com/forms/d/e/${formId}/viewform?usp=pp_url&entry.${productFieldId}=${encodeURIComponent(productName)}`;
    
    // Open the form in a new tab
    window.open(formUrl, '_blank');
  }
</script>