program main
    implicit none
    integer :: i
    integer :: start_count, end_count, count_rate
    integer(8) :: total_duration_ns
    real(8) :: avg_time_ms

    call system_clock(count_rate = count_rate)
    call system_clock(start_count)

    do i = 1, 100
        call hello()
    end do

    call system_clock(end_count)

    total_duration_ns = int((real(end_count - start_count, 8) / count_rate) * 1.0e9)
    avg_time_ms = real(total_duration_ns, 8) / 100.0d0 / 1.0e6

    print *, "Total time for 100 runs: ", total_duration_ns, " ns"
    print *, "Average time per function call: ", avg_time_ms, " ms"

end program main


subroutine hello()
    implicit none
    integer :: x

    x = 0
    do while (x < 1000000)
        x = x + 1
    end do

end subroutine hello

