{-# OPTIONS --without-K #-}
module category.core where

open import level
open import equality
open import graph.core
open import hott.level.core

record IsCategory₀ {𝑖 𝑗} (𝓒 : Graph 𝑖 𝑗) : Set (𝑖 ⊔ 𝑗) where
  field
    id : (x : obj 𝓒) → hom 𝓒 x x
    _∘_ : {x y z : obj 𝓒} → hom 𝓒 y z → hom 𝓒 x y → hom 𝓒 x z

open IsCategory₀ ⦃ ... ⦄ public

record IsCategory {𝑖 𝑗} (𝓒 : Graph 𝑖 𝑗) ⦃ 𝓒-cat : IsCategory₀ 𝓒 ⦄ : Set (𝑖 ⊔ 𝑗) where
  field
    lunit : {x y : obj 𝓒} (f : hom 𝓒 x y) → id y ∘ f ≡ f
    runit : {x y : obj 𝓒} (f : hom 𝓒 x y) → f ∘ id x ≡ f
    assoc : {x y z w : obj 𝓒} (f : hom 𝓒 z w) (g : hom 𝓒 y z) (h : hom 𝓒 x y)
          → (f ∘ g) ∘ h ≡ f ∘ (g ∘ h)
    trunc : (x y : obj 𝓒) → h 2 (hom 𝓒 x y)

open IsCategory ⦃ ... ⦄ public
