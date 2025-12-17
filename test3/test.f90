program main
    implicit none
    integer :: i
    integer :: start_count, end_count, count_rate
    integer(8) :: total_duration_ns
    real(8) :: avg_time_ms

    call system_clock(count_rate = count_rate)
    call system_clock(start_count)

    do i = 1, 100
        call fib(70)
    end do

    call system_clock(end_count)

    total_duration_ns = int((real(end_count - start_count, 8) / count_rate) * 1.0e9)
    avg_time_ms = real(total_duration_ns, 8) / 100.0d0 / 1.0e6

    print *, "Total time for 100 runs: ", total_duration_ns, " ns"
    print *, "Average time per function call: ", avg_time_ms, " ms"

end program main


subroutine fib(n)
    implicit none
    integer, intent(in) :: n
    real(8) :: phi, psi
    integer(8) :: fib_n
    phi = (1.0d0 + sqrt(5.0d0)) / 2.0d0
    psi = (1.0d0 - sqrt(5.0d0)) / 2.0d0
    fib_n = nint((phi**n - psi**n) / sqrt(5.0d0))
end subroutine fib