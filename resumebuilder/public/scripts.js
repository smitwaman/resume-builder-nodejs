document.addEventListener('DOMContentLoaded', () => {
    const tabs = document.querySelectorAll('.tab-btn');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            const tabContentId = tab.getAttribute('data-tab');
            const tabContent = document.getElementById(tabContentId);

            if (tabContent) {
                const allTabs = document.querySelectorAll('.tab-content');
                allTabs.forEach(t => t.style.display = 'none');

                tabContent.style.display = 'block';
            }
        });
    });
});
