#ifndef _WINKVMGFP_H_
#define _WINKVMGFP_H_

#ifdef __WINKVM__

/*
 * GFP bitmasks..
 *
 * Zone modifiers (see linux/mmzone.h - low three bits)
 *
 * Do not put any conditional on these. If necessary modify the definitions
 * without the underscores and use the consistently. The definitions here may
 * be used in bit comparisons.
 */
#define __GFP_DMA	(0x01u)
#define __GFP_HIGHMEM	(0x02u)
#define __GFP_DMA32	(0x04u)

/*
 * Action modifiers - doesn't change the zoning
 *
 * __GFP_REPEAT: Try hard to allocate the memory, but the allocation attempt
 * _might_ fail.  This depends upon the particular VM implementation.
 *
 * __GFP_NOFAIL: The VM implementation _must_ retry infinitely: the caller
 * cannot handle allocation failures.
 *
 * __GFP_NORETRY: The VM implementation must not retry indefinitely.
 *
 * __GFP_MOVABLE: Flag that this page will be movable by the page migration
 * mechanism or reclaimed
 */
#define __GFP_WAIT	(0x10u)	/* Can wait and reschedule? */
#define __GFP_HIGH	(0x20u)	/* Should access emergency pools? */
#define __GFP_IO	(0x40u)	/* Can start physical IO? */
#define __GFP_FS	(0x80u)	/* Can call down to low-level FS? */
#define __GFP_COLD	(0x100u)	/* Cache-cold page required */
#define __GFP_NOWARN	(0x200u)	/* Suppress page allocation failure warning */
#define __GFP_REPEAT	(0x400u)	/* Retry the allocation.  Might fail */
#define __GFP_NOFAIL	(0x800u)	/* Retry for ever.  Cannot fail */
#define __GFP_NORETRY	(0x1000u)/* Do not retry.  Might fail */
#define __GFP_COMP	(0x4000u)/* Add compound page metadata */
#define __GFP_ZERO	(0x8000u)/* Return zeroed page on success */
#define __GFP_NOMEMALLOC (0x10000u) /* Don't use emergency reserves */
#define __GFP_HARDWALL   (0x20000u) /* Enforce hardwall cpuset memory allocs */
#define __GFP_THISNODE	(0x40000u)/* No fallback, no policies */
#define __GFP_RECLAIMABLE (0x80000u) /* Page is reclaimable */
#define __GFP_MOVABLE	(0x100000u)  /* Page is movable */

#define __GFP_BITS_SHIFT 21	/* Room for 21 __GFP_FOO bits */
#define __GFP_BITS_MASK (((1 << __GFP_BITS_SHIFT) - 1))

/* This equals 0, but use constants in case they ever change */
#define GFP_NOWAIT	(GFP_ATOMIC & ~__GFP_HIGH)
/* GFP_ATOMIC means both !wait (__GFP_WAIT not set) and use emergency pool */
#define GFP_ATOMIC	(__GFP_HIGH)
#define GFP_NOIO	(__GFP_WAIT)
#define GFP_NOFS	(__GFP_WAIT | __GFP_IO)
#define GFP_KERNEL	(__GFP_WAIT | __GFP_IO | __GFP_FS)
#define GFP_TEMPORARY	(__GFP_WAIT | __GFP_IO | __GFP_FS | \
			 __GFP_RECLAIMABLE)
#define GFP_USER	(__GFP_WAIT | __GFP_IO | __GFP_FS | __GFP_HARDWALL)
#define GFP_HIGHUSER	(__GFP_WAIT | __GFP_IO | __GFP_FS | __GFP_HARDWALL | \
			 __GFP_HIGHMEM)
#define GFP_HIGHUSER_MOVABLE	(__GFP_WAIT | __GFP_IO | __GFP_FS | \
				 __GFP_HARDWALL | __GFP_HIGHMEM | \
				 __GFP_MOVABLE)
#define GFP_NOFS_PAGECACHE	(__GFP_WAIT | __GFP_IO | __GFP_MOVABLE)
#define GFP_USER_PAGECACHE	(__GFP_WAIT | __GFP_IO | __GFP_FS | \
				 __GFP_HARDWALL | __GFP_MOVABLE)
#define GFP_HIGHUSER_PAGECACHE	(__GFP_WAIT | __GFP_IO | __GFP_FS | \
				 __GFP_HARDWALL | __GFP_HIGHMEM | \
				 __GFP_MOVABLE)

#ifdef CONFIG_NUMA
#define GFP_THISNODE	(__GFP_THISNODE | __GFP_NOWARN | __GFP_NORETRY)
#else
#define GFP_THISNODE	(0)
#endif

/* This mask makes up all the page movable related flags */
#define GFP_MOVABLE_MASK (__GFP_RECLAIMABLE|__GFP_MOVABLE)

/* Control page allocator reclaim behavior */
#define GFP_RECLAIM_MASK (__GFP_WAIT|__GFP_HIGH|__GFP_IO|__GFP_FS|\
			__GFP_NOWARN|__GFP_REPEAT|__GFP_NOFAIL|\
			__GFP_NORETRY|__GFP_NOMEMALLOC)

/* Control allocation constraints */
#define GFP_CONSTRAINT_MASK (__GFP_HARDWALL|__GFP_THISNODE)

/* Do not use these with a slab allocator */
#define GFP_SLAB_BUG_MASK (__GFP_DMA32|__GFP_HIGHMEM|~__GFP_BITS_MASK)

/* Flag - indicates that the buffer will be suitable for DMA.  Ignored on some
   platforms, used as appropriate on others */

#define GFP_DMA		__GFP_DMA

/* 4GB DMA on some platforms */
#define GFP_DMA32	__GFP_DMA32

#undef GFP_T

#endif /* __WINKVM__ */

#endif /* _WINKVMGFP_H_ */
