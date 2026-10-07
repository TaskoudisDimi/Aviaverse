<template>
  <div class="min-h-full">
    <div class="bg-white border-b border-slate-200 px-4 sm:px-6 py-8">
      <div class="max-w-5xl mx-auto text-center">
        <h1 class="text-2xl font-bold text-slate-900">Suggested Literature</h1>
        <p class="text-slate-500 text-sm mt-1 max-w-2xl mx-auto">
          A technical reference library by Professor Apostolos Polyzakis, covering propulsion,
          thermodynamics, aircraft technology and related engineering subjects.
        </p>
      </div>
    </div>

    <div class="p-4 sm:p-6 max-w-5xl mx-auto space-y-8">
      <!-- Author / publisher card -->
      <div class="bg-white border border-slate-200 rounded-2xl p-6 flex flex-col sm:flex-row sm:items-center gap-5">
        <div class="w-14 h-14 rounded-2xl bg-aviation-50 flex items-center justify-center shrink-0">
          <svg class="w-7 h-7 text-aviation-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
              d="M12 6.042A8.967 8.967 0 0 0 6 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 0 1 6 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 0 1 6-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0 0 18 18a8.967 8.967 0 0 0-6 2.292m0-14.25v14.25" />
          </svg>
        </div>
        <div class="flex-1">
          <p class="font-semibold text-slate-900">Apostolos Polyzakis</p>
          <p class="text-sm text-slate-500">Power Heat Cool (P.H.C.) Publications</p>
        </div>
        <div class="flex flex-col sm:items-end gap-1 text-sm">
          <a href="mailto:apolyzakis@yahoo.gr" @click="copyEmail"
            class="text-aviation-600 hover:text-aviation-700 font-medium">
            {{ emailCopied ? 'Copied to clipboard ✓' : 'apolyzakis@yahoo.gr' }}
          </a>
          <a href="tel:+306946466391" class="text-slate-500 hover:text-aviation-600">
            +30 694 646 6391
          </a>
          <a href="https://powerheatcool.gr" target="_blank" rel="noopener"
            class="text-slate-500 hover:text-aviation-600">
            powerheatcool.gr →
          </a>
        </div>
      </div>

      <!-- Book grid -->
      <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-5">
        <a v-for="b in books" :key="b.isbn" :href="`https://powerheatcool.gr/${b.slug}`" target="_blank" rel="noopener"
          class="group bg-white border border-slate-200 rounded-2xl overflow-hidden flex flex-col
                 hover:border-aviation-300 hover:shadow-lg hover:shadow-aviation-100 transition-all">
          <div class="aspect-[4/5] bg-slate-100 overflow-hidden">
            <img :src="`/img/books/${b.cover}`" :alt="b.title"
              class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
          </div>
          <div class="p-4 flex flex-col flex-1 gap-2">
            <h3 class="text-sm font-semibold text-slate-900 leading-snug group-hover:text-aviation-600 transition-colors">
              {{ b.title }}
            </h3>
            <div class="text-xs text-slate-400 mt-auto space-y-0.5">
              <p>ISBN {{ b.isbn }}</p>
              <p>{{ b.pages }} pages · Soft cover · A4 · Full color</p>
            </div>
            <span class="text-xs font-medium text-aviation-600 flex items-center gap-1">
              View on powerheatcool.gr
              <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M13.5 6H5.25A2.25 2.25 0 0 0 3 8.25v10.5A2.25 2.25 0 0 0 5.25 21h10.5A2.25 2.25 0 0 0 18 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25" />
              </svg>
            </span>
          </div>
        </a>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const emailCopied = ref(false)
async function copyEmail() {
  try {
    await navigator.clipboard.writeText('apolyzakis@yahoo.gr')
    emailCopied.value = true
    setTimeout(() => { emailCopied.value = false }, 2000)
  } catch {}
}

interface Book {
  slug: string
  title: string
  cover: string
  isbn: string
  pages: number
}

const books: Book[] = [
  { slug: 'aerospace-propulsion-systems', title: 'Αεροδιαστημικά Προωθητικά Συστήματα', cover: 'Book-aerodiastimika.jpg', isbn: '978-618-84965-6-9', pages: 702 },
  { slug: 'aircraft-technology', title: 'Τεχνολογία Αεροσκαφών', cover: 'Book-texnologia.jpg', isbn: '978-618-84965-1-4', pages: 954 },
  { slug: 'operation-turbines', title: 'Λειτουργία Αεριοστρόβιλων: Προώθηση και Ισχύς', cover: 'Book-aeriostrobiloi.jpg', isbn: '978-618-84965-2-1', pages: 908 },
  { slug: 'fluid-dynamic-engines', title: 'Ρευστοδυναμικές Μηχανές: Στροβιλομηχανές - Υδροδυναμικές Μηχανές', cover: 'Book-reusto.jpg', isbn: '978-618-84965-0-7', pages: 794 },
  { slug: 'statics', title: 'Στατική - Αντοχή Υλικών - Τεχνολογία Υλικών', cover: 'Book-static.jpg', isbn: '978-918-84965-9-0', pages: 816 },
  { slug: 'thermodynamics', title: 'Θερμοδυναμική και Προχωρημένη Θερμοδυναμική', cover: 'Book-thermodynamiki.jpg', isbn: '978-618-83590-4-8', pages: 794 },
  { slug: 'airports-innovative-technologies', title: 'Αεροδρόμια - Ελικοδρόμια - Υδατοδρόμια - Καινοτόμες Τεχνολογίες', cover: 'Book-airports.jpg', isbn: '978-618-5731-05-2', pages: 850 },
  { slug: 'heat-transfer', title: 'Μετάδοση Θερμότητας, Μεταφορά Μάζας και Συσκευές Διεργασιών', cover: 'Book-metadosi-thermotitas.jpg', isbn: '978-618-83590-7-9', pages: 960 },
  { slug: 'steam-generators-steam-turbines', title: 'Ατμοπαραγωγοί - Ατμοστρόβιλοι και Σταθμοί Παραγωγής Ηλεκτρικής Ισχύος', cover: 'Book-atmoparagogoi.jpg', isbn: '978-618-84965-8-3', pages: 830 },
  { slug: 'power-units', title: 'Μηχανές Εσωτερικής Καύσης, Ηλεκτρικά, Υβριδικά, Υδρογονοκίνητα Οχήματα και Τεχνολογία Οχημάτων', cover: 'Book-monades.jpg', isbn: '978-618-83590-9-3', pages: 972 },
  { slug: 'marine-engines', title: 'Ναυτικές Μηχανές Εσωτερικής Καύσης Υβριδικές, Ηλεκτρικές Μονάδες Ισχύος και Συστήματα Πλοίου', cover: 'Book-nautikes.jpg', isbn: '978-618-84965-7-6', pages: 806 },
  { slug: 'nuclear-energy', title: 'Πυρηνική Ενέργεια και Τεχνολογικές Εφαρμογές', cover: 'Book-pyrhnikh-energeia.jpg', isbn: '978-618-84965-3-8', pages: 608 },
  { slug: 'energy-environment', title: 'Ενέργεια, Περιβάλλον και Αειφόρος Ανάπτυξη', cover: 'Book-energeia.jpg', isbn: '978-618-83590-6-2', pages: 966 },
]
</script>
