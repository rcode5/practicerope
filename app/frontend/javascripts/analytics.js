const trackEvent = (name, category = null, label = null) => {
  const args = {
    event_category: category,
    event_label: label,
  };
  if (!window.gtag) {
    console.warn("gtag is not available");
  } else {
    gtag("event", name, args);
  }
};

export { trackEvent };
