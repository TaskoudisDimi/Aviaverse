import { defineStore } from 'pinia'
import { ref } from 'vue'

interface Option { id: string; text: string }
interface Question { id: string; text: string; options: Option[] }

export interface ExamSession {
  exam_id: string
  questions: Question[]
  started_at: string
  ends_at: string
}

export const useExamStore = defineStore('exam', () => {
  const session = ref<ExamSession | null>(null)

  function setSession(s: ExamSession) {
    session.value = s
  }

  function clearSession() {
    session.value = null
  }

  return { session, setSession, clearSession }
})
