<script setup lang="ts">
import { ref, onMounted } from 'vue'

import { valueUpdater } from '@/lib/utils'

import { Table } from '@/components/ui/table'
import { TableBody } from '@/components/ui/table'
import { TableCell } from '@/components/ui/table'
import { TableHead } from '@/components/ui/table'
import { TableHeader } from '@/components/ui/table'
import { TableRow } from '@/components/ui/table'

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

import { Button } from '@/components/ui/button'

import {
  FlexRender,
  getCoreRowModel,
  getPaginationRowModel,
  useVueTable,
} from '@tanstack/vue-table'

import { DoubleArrowRightIcon, DoubleArrowLeftIcon, ChevronRightIcon, ChevronLeftIcon    } from '@radix-icons/vue'


defineProps<{ msg: string }>()

const agents = ref({})

onMounted(async () => {
  const res = await fetch('/api/agents')
  const data = await res.json()
  agents.value = data

  console.log(data)
})

const pageSize = ref(10)

const table = useVueTable({
  get data() { return agents },
  get columns() { return [{ acessorKey: 'id' }] },
  state: {
    get pageSize() { return pageSize },
  },
  getCoreRowModel: getCoreRowModel(),
  getPaginationRowModel: getPaginationRowModel(),
})

</script>

<template>
  <Table>
    <TableHeader>
      <TableRow>
        <TableHead class="w-[100px]">
          Id
        </TableHead>
        <TableHead>Data</TableHead>
        <TableHead>Processed</TableHead>
        <TableHead>Created At</TableHead>
      </TableRow>
    </TableHeader>

    <TableBody>
      <TableRow  v-for="row in table.getRowModel().rows" :key="row.original.id">
        <TableCell class="font-medium">
          {{ row.original.id }}
        </TableCell>

        <TableCell class="font-medium">
          {{ row.original.data }}
        </TableCell>
        <TableCell class="font-medium">
          {{ row.original.processed }}
        </TableCell>
        <TableCell class="font-medium">
          {{ row.original.created_at }}
        </TableCell>
      </TableRow>
    </TableBody>
  </Table>

    <div class="flex items-center justify-between px-2">
    <div class="flex items-center space-x-6 lg:space-x-8">
      <div class="flex items-center space-x-2">
        <p class="text-sm font-medium">
          Rows per page
        </p>
        <Select
          :model-value="`${table.getState().pagination.pageSize}`"
          @update:model-value="table.setPageSize"
        >
          <SelectTrigger class="h-8 w-[70px]">
            <SelectValue :placeholder="`${table.getState().pagination.pageSize}`" />
          </SelectTrigger>
          <SelectContent side="top">
            <SelectItem v-for="pageSize in [10, 20, 30, 40, 50]" :key="pageSize" :value="`${pageSize}`">
              {{ pageSize }}
            </SelectItem>
          </SelectContent>
        </Select>
      </div>
      <div class="flex w-[100px] items-center justify-center text-sm font-medium">
        Page {{ table.getState().pagination.pageIndex + 1 }} of
        {{ table.getPageCount() }}
      </div>
      <div class="flex items-center space-x-2">
        <Button
          variant="outline"
          class="hidden h-8 w-8 p-0 lg:flex"
          :disabled="!table.getCanPreviousPage()"
          @click="table.setPageIndex(0)"
        >
          <span class="sr-only">Go to first page</span>
          <DoubleArrowLeftIcon class="h-4 w-4" />
        </Button>
        <Button
          variant="outline"
          class="h-8 w-8 p-0"
          :disabled="!table.getCanPreviousPage()"
          @click="table.previousPage()"
        >
          <span class="sr-only">Go to previous page</span>
          <ChevronLeftIcon class="h-4 w-4" />
        </Button>
        <Button
          variant="outline"
          class="h-8 w-8 p-0"
          :disabled="!table.getCanNextPage()"
          @click="table.nextPage()"
        >
          <span class="sr-only">Go to next page</span>
          <ChevronRightIcon class="h-4 w-4" />
        </Button>
        <Button
          variant="outline"
          class="hidden h-8 w-8 p-0 lg:flex"
          :disabled="!table.getCanNextPage()"
          @click="table.setPageIndex(table.getPageCount() - 1)"
        >
          <span class="sr-only">Go to last page</span>
          <DoubleArrowRightIcon class="h-4 w-4" />
        </Button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
